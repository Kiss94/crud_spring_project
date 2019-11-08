package kz.epam.raiymbek.mapper;


import org.springframework.jdbc.core.RowMapper;
import kz.epam.raiymbek.entity.MatchLineup;

import java.sql.ResultSet;
import java.sql.SQLException;

public class MatchLineupMapper implements RowMapper {
    private static final String MATCH_ID = "match_id";
    private static final String TEAM_ID = "team_id";
    private static final String PLAYER_ID = "player_id";
    @Override
    public Object mapRow(ResultSet resultSet, int i) throws SQLException {
        MatchLineup matchLineup = new MatchLineup();
        matchLineup.setMatchId(resultSet.getInt(MATCH_ID));
        matchLineup.setTeamId(resultSet.getInt(TEAM_ID));
        matchLineup.setPlayerId(resultSet.getInt(PLAYER_ID));
        return matchLineup;
    }
}
