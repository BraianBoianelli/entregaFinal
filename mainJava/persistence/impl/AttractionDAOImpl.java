package persistence.impl;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import model.Attraction;
import model.User;
import persistence.AttractionDAO;
import persistence.commons.ConnectionProvider;
import persistence.commons.DAOFactory;
import persistence.commons.MissingDataException;

public class AttractionDAOImpl implements AttractionDAO {

	public List<Attraction> findAll() {
		try {
			String sql = "SELECT * FROM ATTRACTIONS";
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement statement = conn.prepareStatement(sql);
			ResultSet resultados = statement.executeQuery();

			List<Attraction> attractions = new LinkedList<Attraction>();
			while (resultados.next()) {
				attractions.add(toAttraction(resultados));
			}

			return attractions;
		} catch (Exception e) {
			throw new MissingDataException(e);
		}
	}

	@Override
	public Attraction find(Integer id) {
		try {
			String sql = "SELECT * FROM ATTRACTIONS WHERE id = ?";
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setInt(1, id);

			ResultSet resultados = statement.executeQuery();

			Attraction attraction = null;
			if (resultados.next()) {
				attraction = toAttraction(resultados);
			}

			return attraction;
		} catch (Exception e) {
			throw new MissingDataException(e);
		}
	}

	private Attraction toAttraction(ResultSet attractionRegister) throws SQLException {
		return new Attraction(attractionRegister.getInt(1), attractionRegister.getString(2),
				attractionRegister.getInt(3), attractionRegister.getDouble(4), attractionRegister.getInt(5),
				attractionRegister.getString(6), attractionRegister.getString(7), attractionRegister.getString(9));
	}

	@Override
	public int insert(Attraction attraction) {
		try {
			String sql = "INSERT INTO ATTRACTIONS (NAME, COST, DURATION, CAPACITY, descripcion, imagen,"
					+ "capacity_original, type)" + " VALUES (?, ?, ?, ?, ?, ?,?,?)";
			Connection conn = ConnectionProvider.getConnection();

			PreparedStatement statement = conn.prepareStatement(sql);
			int i = 1;
			statement.setString(i++, attraction.getName());
			statement.setInt(i++, attraction.getCost());
			statement.setDouble(i++, attraction.getDuration());
			statement.setInt(i++, attraction.getCapacity());
			statement.setString(i++, attraction.getDescripcion());
			statement.setString(i++, attraction.getImagen());
			statement.setInt(i++, attraction.getCapacity());
			statement.setString(i++, attraction.getType());

			int rows = statement.executeUpdate();

			return rows;
		} catch (Exception e) {
			throw new MissingDataException(e);
		}
	}

	@Override
	public int update(Attraction attraction) {
		try {
			String sql = "UPDATE ATTRACTIONS SET NAME = ?, COST = ?, DURATION = ?, CAPACITY = ?, "
					+ " descripcion = ?, imagen = ? WHERE ID = ?";
			Connection conn = ConnectionProvider.getConnection();

			PreparedStatement statement = conn.prepareStatement(sql);
			int i = 1;
			statement.setString(i++, attraction.getName());
			statement.setInt(i++, attraction.getCost());
			statement.setDouble(i++, attraction.getDuration());
			statement.setInt(i++, attraction.getCapacity());
			statement.setString(i++, attraction.getDescripcion());
			statement.setString(i++, attraction.getImagen());
			statement.setInt(i++, attraction.getId());

			int rows = statement.executeUpdate();

			return rows;
		} catch (Exception e) {
			throw new MissingDataException(e);
		}
	}

	@Override
	public int delete(Attraction attraction) {
		try {
			String sql = "DELETE FROM ATTRACTIONS WHERE ID = ?";
			Connection conn = ConnectionProvider.getConnection();

			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setInt(1, attraction.getId());
			int rows = statement.executeUpdate();

			return rows;
		} catch (Exception e) {
			throw new MissingDataException(e);
		}
	}

	@Override
	public int countAll() {
		try {
			String sql = "SELECT COUNT(1) AS TOTAL FROM ATTRACTIONS";
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement statement = conn.prepareStatement(sql);
			ResultSet resultados = statement.executeQuery();

			resultados.next();
			int total = resultados.getInt("TOTAL");

			return total;
		} catch (Exception e) {
			throw new MissingDataException(e);
		}
	}

	public List<Attraction> findPreferidas(User user) {
		try {
			String sql = "SELECT * FROM attractions WHERE type = ? ORDER BY cost DESC, duration ASC";

			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setString(1, user.getTypeAttractions());

			ResultSet resultados = statement.executeQuery();

			List<Attraction> attractionsPreferidas = new LinkedList<Attraction>();

			while (resultados.next()) {
				attractionsPreferidas.add(toAttraction(resultados));
			}

			return attractionsPreferidas;
		} catch (Exception e) {
			throw new MissingDataException(e);
		}
	}

	@Override
	public List<Attraction> findNotPreferidas(User user) {
		
			try {
				String sql = "SELECT * FROM attractions WHERE type != ? ORDER BY cost DESC, duration ASC";

				Connection conn = ConnectionProvider.getConnection();
				PreparedStatement statement = conn.prepareStatement(sql);
				statement.setString(1, user.getTypeAttractions());

				ResultSet resultados = statement.executeQuery();

				List<Attraction> attractionsPreferidas = new LinkedList<Attraction>();

				while (resultados.next()) {
					attractionsPreferidas.add(toAttraction(resultados));
				}

				return attractionsPreferidas;
			} catch (Exception e) {
				throw new MissingDataException(e);
			}
	}

	

}