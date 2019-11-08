package kz.epam.raiymbek.dao.impl;

import kz.epam.raiymbek.dao.MatchLineupDAO;
import kz.epam.raiymbek.entity.MatchLineup;
import kz.epam.raiymbek.mapper.MatchLineupMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.util.List;

@Component
public class MatchLineupDAOImpl implements MatchLineupDAO {
    private JdbcTemplate jdbcTemplate;
    private static final String SQL_FIND_MATCH_LINEUP = "SELECT * FROM MATCH_LINEUPS WHERE match_id = ?, player_id = ?";
    private static final String SQL_GET_ALL = "SELECT * FROM MATCH_LINEUPS";
    private static final String SQL_DELETE_MATCH_LINEUP = "DELETE FROM MATCH_LINEUPS WHERE match_id = ?, player_id = ?";
    private static final String SQL_UPDATE_MATCH_LINEUP = "UPDATE MATCH_LINEUPS SET match_id = ?, team_id = ?, player_id = ?";
    private static final String SQL_INSERT_MATCH_LINEUP = "INSERT INTO MATCH_LINEUPS (match_id, team_id, player_id) VALUES (?, ?, ?)";

    @Autowired
    public MatchLineupDAOImpl(DataSource dataSource) {
        jdbcTemplate = new JdbcTemplate(dataSource);
    }
    @Override
    public List<MatchLineup> listAllMatchLineups() {
        return jdbcTemplate.query(SQL_GET_ALL, new MatchLineupMapper());
    }

    @Override
    public boolean add(MatchLineup matchLineup) {
        return jdbcTemplate.update(SQL_INSERT_MATCH_LINEUP, matchLineup.getMatchId(),matchLineup.getPlayerId(),matchLineup.getPlayerId())>0;
    }

    @Override
    public boolean delete(MatchLineup matchLineup) {
        return jdbcTemplate.update(SQL_DELETE_MATCH_LINEUP, matchLineup.getMatchId(), matchLineup.getPlayerId()) > 0;
    }

    @Override
    public boolean edit(MatchLineup matchLineup) {
        return jdbcTemplate.update(SQL_UPDATE_MATCH_LINEUP, matchLineup.getMatchId(), matchLineup.getTeamId(), matchLineup.getPlayerId()) > 0;
    }

    @Override
    public MatchLineup getMatchLineup(int id) {
        return (MatchLineup) jdbcTemplate.queryForObject(SQL_FIND_MATCH_LINEUP, new Object [] {id}, new MatchLineupMapper());
    }
}
