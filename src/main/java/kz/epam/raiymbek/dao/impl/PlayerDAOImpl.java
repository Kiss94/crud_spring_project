package kz.epam.raiymbek.dao.impl;

import kz.epam.raiymbek.dao.PlayerDAO;
import kz.epam.raiymbek.entity.Player;
import kz.epam.raiymbek.mapper.PlayerMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.util.List;

@Component
public class PlayerDAOImpl implements PlayerDAO {
    private JdbcTemplate jdbcTemplate;
    private static final String SQL_FIND_PLAYER = "SELECT * FROM PLAYERS WHERE player_id = ?";
    private static final String SQL_GET_ALL = "SELECT * FROM PLAYERS";
    private static final String SQL_DELETE_PLAYER = "DELETE FROM PLAYERS WHERE player_id = ?";
    private static final String SQL_UPDATE_PLAYER = "UPDATE PLAYERS SET name = ?, surname = ?, player_number = ?, team_id = ? WHERE player_id = ?";
    private static final String SQL_INSERT_PLAYER = "INSERT INTO PLAYERS (name, surname, player_number, team_id) VALUES (?, ?, ?, ?)";
    @Autowired
    public PlayerDAOImpl(DataSource dataSource) {
        jdbcTemplate = new JdbcTemplate(dataSource);
    }

    @Override
    public List<Player> listAllPlayers() {
        return jdbcTemplate.query(SQL_GET_ALL, new PlayerMapper());
    }

    @Override
    public boolean add(Player player) {
        return jdbcTemplate.update(SQL_INSERT_PLAYER, player.getName(), player.getSurname(), player.getPlayerNumber(),
                                   player.getTeamId()) > 0;
    }

    @Override
    public boolean delete(Player player) {
        return jdbcTemplate.update(SQL_DELETE_PLAYER, player.getPlayerId()) > 0;
    }

    @Override
    public boolean edit(Player player) {
        return jdbcTemplate.update(SQL_UPDATE_PLAYER, player.getName(), player.getSurname(), player.getPlayerNumber(),
                                   player.getTeamId(), player.getPlayerId()) > 0;
    }

    @Override
    public Player getPlayer(int id) {
        return jdbcTemplate.queryForObject(SQL_FIND_PLAYER, new Object [] { id}, new PlayerMapper());
    }
}
