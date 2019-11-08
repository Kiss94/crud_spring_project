package kz.epam.raiymbek.dao.impl;

import kz.epam.raiymbek.dao.GoalStatisticDAO;
import kz.epam.raiymbek.entity.GoalStatistic;
import kz.epam.raiymbek.mapper.GoalStatisticMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.util.List;

@Component
public class GoalStatisticDAOImpl implements GoalStatisticDAO {

    private JdbcTemplate jdbcTemplate;
    private static final String SQL_FIND_GOAL_STATISTICS = "SELECT * FROM GOAL_STATISTICS WHERE goal_id = ?";
    private static final String SQL_GET_ALL = "SELECT * FROM GOAL_STATISTICS";
    private static final String SQL_DELETE_GOAL_STATISTICS = "DELETE FROM GOAL_STATISTICS WHERE goal_id = ?";
    private static final String SQL_UPDATE_GOAL_STATISTICS = "UPDATE GOAL_STATISTICS SET match_id = ?, player_id = ?, minute_of_goal = ?";
    private static final String SQL_INSERT_GOAL_STATISTICS = "INSERT INTO GOAL_STATISTICS (match_id, player_id, minute_of_goal) VALUES (?, ?, ?)";

    @Autowired
    public GoalStatisticDAOImpl(DataSource dataSource){
        jdbcTemplate = new JdbcTemplate(dataSource);
    }
    @Override
    public List<GoalStatistic> listAllGoalStatistic() {
        return jdbcTemplate.query(SQL_GET_ALL, new GoalStatisticMapper());
    }

    @Override
    public boolean add(GoalStatistic goalStatistic) {
        return jdbcTemplate.update(SQL_INSERT_GOAL_STATISTICS, goalStatistic.getMatchId(), goalStatistic.getPlayerId(), goalStatistic.getMinuteOfGoal() ) > 0;
    }

    @Override
    public boolean delete(GoalStatistic goalStatistic) {
        return jdbcTemplate.update(SQL_DELETE_GOAL_STATISTICS, goalStatistic.getGoalId()) > 0;
    }

    @Override
    public boolean edit(GoalStatistic goalStatistic) {
        return jdbcTemplate.update(SQL_UPDATE_GOAL_STATISTICS, goalStatistic.getMatchId(), goalStatistic.getPlayerId(), goalStatistic.getMinuteOfGoal() ) > 0;
    }

    @Override
    public GoalStatistic getGoalStatistic(int id) {
        return (GoalStatistic) jdbcTemplate.queryForObject(SQL_FIND_GOAL_STATISTICS, new Object [] { id}, new GoalStatisticMapper());
    }
}
