package kz.epam.raiymbek.entity;

import lombok.*;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class GoalStatistic {
    private int goalId;
    private int matchId;
    private int playerId;
    private int minuteOfGoal;
}
