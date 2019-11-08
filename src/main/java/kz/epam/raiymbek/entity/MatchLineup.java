package kz.epam.raiymbek.entity;

import lombok.*;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MatchLineup {
    private int matchId;
    private int teamId;
    private int playerId;
}
