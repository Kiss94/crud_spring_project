package kz.epam.raiymbek.dao.impl;

import kz.epam.raiymbek.dao.MatchDAO;
import kz.epam.raiymbek.entity.Match;
import kz.epam.raiymbek.mapper.MatchMapper;
import kz.epam.raiymbek.mapper.TeamMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.util.List;


@Component
public class MatchDAOImpl implements MatchDAO {
    private JdbcTemplate jdbcTemplate;
    private static final String SQL_FIND_MATCH = "SELECT * FROM MATCHES WHERE match_id = ?";
    private static final String SQL_GET_ALL = "SELECT * FROM MATCHES";
    private static final String SQL_DELETE_MATCH = "DELETE FROM MATCHES WHERE match_id = ?";
    private static final String SQL_UPDATE_MATCH = "UPDATE MATCHES SET date = ?, stadium = ?, team_one_id = ?, team_two_id = ?, team_one_score = ?, team_two_score = ?";
    private static final String SQL_INSERT_MATCH = "INSERT INTO MATCHES (date, stadium, team_one_id, team_two_id, team_one_score, team_two_score) VALUES (?, ?, ?, ?, ?, ?)";

    @Autowired
    public MatchDAOImpl(DataSource dataSource) {
        jdbcTemplate = new JdbcTemplate(dataSource);
    }
    @Override
    public List<Match> listAllMatches() {
        return jdbcTemplate.query(SQL_GET_ALL, new TeamMapper());
    }

    @Override
    public boolean add(Match match) {
        return jdbcTemplate.update(SQL_INSERT_MATCH, match.getDate(), match.getStadium(), match.getTeamOneId(), match.getTeamTwoId(), match.getTeamOneScore(), match.getTeamTwoScore()) > 0;
    }

    @Override
    public boolean delete(Match match) {
        return jdbcTemplate.update(SQL_DELETE_MATCH, match.getMatchId()) > 0;
    }

    @Override
    public boolean edit(Match match) {
        return jdbcTemplate.update(SQL_UPDATE_MATCH, match.getDate(), match.getStadium(), match.getTeamOneId(), match.getTeamTwoId(), match.getTeamOneScore(), match.getTeamTwoScore()) > 0;
    }

    @Override
    public Match getMatch(int id) {
        return (Match) jdbcTemplate.queryForObject(SQL_FIND_MATCH, new Object [] { id}, new MatchMapper());
    }
}
