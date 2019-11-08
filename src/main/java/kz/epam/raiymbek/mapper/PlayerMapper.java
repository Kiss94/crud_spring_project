package kz.epam.raiymbek.mapper;

import kz.epam.raiymbek.entity.Player;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class PlayerMapper implements RowMapper<Player> {
    private static final String PLAYER_ID = "player_id";
    private static final String NAME = "name";
    private static final String SURNAME = "surname";
    private static final String PLAYER_NUMBER = "player_number";
    private static final String TEAM_ID = "team_id";
    @Override
    public Player mapRow(ResultSet resultSet, int i) throws SQLException {
        Player player = new Player();
        player.setPlayerId(resultSet.getInt(PLAYER_ID));
        player.setName(resultSet.getString(NAME));
        player.setSurname(resultSet.getString(SURNAME));
        player.setPlayerNumber(resultSet.getInt(PLAYER_NUMBER));
        player.setTeamId(resultSet.getInt(TEAM_ID));
        return player;
    }
}
