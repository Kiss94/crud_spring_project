package kz.epam.raiymbek.dao.impl;

import kz.epam.raiymbek.dao.TeamDAO;
import kz.epam.raiymbek.entity.Team;
import kz.epam.raiymbek.mapper.TeamMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.util.List;

@Component
public class TeamDAOImpl implements TeamDAO {
    private JdbcTemplate jdbcTemplate;
    private static final String SQL_FIND_TEAM = "SELECT * FROM TEAMS WHERE team_id = ?";
    private static final String SQL_GET_ALL = "SELECT * FROM TEAMS";
    private static final String SQL_DELETE_TEAM = "DELETE FROM TEAMS WHERE team_id = ?";
    private static final String SQL_UPDATE_TEAM = "UPDATE TEAMS SET name = ?, country = ?";
    private static final String SQL_INSERT_TEAM = "INSERT INTO TEAMS (name, country) VALUES (?, ?)";

    @Autowired
    public TeamDAOImpl(DataSource dataSource) {
        jdbcTemplate = new JdbcTemplate(dataSource);
    }
    @Override
    public List<Team> listAllTeams() {
        return jdbcTemplate.query(SQL_GET_ALL, new TeamMapper());
    }

    @Override
    public boolean add(Team team) {
        return jdbcTemplate.update(SQL_INSERT_TEAM, team.getName(), team.getCountry()) > 0;
    }

    @Override
    public boolean delete(Team team) {
        return jdbcTemplate.update(SQL_DELETE_TEAM, team.getTeamId()) > 0;
    }

    @Override
    public boolean edit(Team team) {
        return jdbcTemplate.update(SQL_UPDATE_TEAM,team.getName(), team.getCountry()) > 0;
    }

    @Override
    public Team getTeam(int id) {
        return (Team) jdbcTemplate.queryForObject(SQL_FIND_TEAM, new Object [] { id}, new TeamMapper());
    }
}
