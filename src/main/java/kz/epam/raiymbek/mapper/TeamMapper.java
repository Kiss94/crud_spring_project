package kz.epam.raiymbek.mapper;

import kz.epam.raiymbek.entity.Team;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class TeamMapper implements RowMapper {
    private static final String TEAM_ID = "team_id";
    private static final String NAME = "name";
    private static final String COUNTRY = "country";
    @Override
    public Team mapRow(ResultSet resultSet, int i) throws SQLException {
        Team team = new Team();
        team.setTeamId(resultSet.getInt(TEAM_ID));
        team.setName(resultSet.getString(NAME));
        team.setCountry(resultSet.getString(COUNTRY));
        return team;
    }
}
