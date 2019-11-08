package kz.epam.raiymbek.service;

import kz.epam.raiymbek.entity.GoalStatistic;

import java.util.List;

public interface GoalStatisticService {
    boolean addGoalStatistic(GoalStatistic goalStatistic);
    boolean deleteGoalStatistic(GoalStatistic goalStatistic);
    boolean editGoalStatistic(GoalStatistic goalStatistic);
    List<GoalStatistic> getAllGoalStatistics();
    GoalStatistic getGoalStatisticById(int id);
}
