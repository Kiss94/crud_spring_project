package kz.epam.raiymbek.mapper;

import kz.epam.raiymbek.entity.Match;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class MatchMapper implements RowMapper {
    private static final String MATCH_ID = "match_id";
    private static final String DATE = "date";
    private static final String STADIUM = "stadium";
    private static final String TEAM_ONE_ID = "team_one_id";
    private static final String TEAM_TWO_ID = "team_two_id";
    private static final String TEAM_ONE_SCORE = "team_one_score";
    private static final String TEAM_TWO_SCORE = "team_two_score";
    @Override
    public Object mapRow(ResultSet resultSet, int i) throws SQLException {
        Match match = new Match();
        match.setMatchId(resultSet.getInt(MATCH_ID));
        match.setDate(resultSet.getDate(DATE));
        match.setStadium(resultSet.getString(STADIUM));
        match.setTeamOneId(resultSet.getInt(TEAM_ONE_ID));
        match.setTeamTwoId(resultSet.getInt(TEAM_TWO_ID));
        match.setTeamOneScore(resultSet.getInt(TEAM_ONE_SCORE));
        match.setTeamTwoScore(resultSet.getInt(TEAM_TWO_SCORE));
        return match;
    }
}
