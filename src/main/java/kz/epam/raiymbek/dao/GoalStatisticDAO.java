package kz.epam.raiymbek.dao;

import kz.epam.raiymbek.entity.GoalStatistic;

import java.util.List;

public interface GoalStatisticDAO {
    List<GoalStatistic> listAllGoalStatistic();
    boolean add(GoalStatistic goalStatistic);
    boolean delete(GoalStatistic goalStatistic);
    boolean edit(GoalStatistic goalStatistic);
    GoalStatistic getGoalStatistic(int id);
}
