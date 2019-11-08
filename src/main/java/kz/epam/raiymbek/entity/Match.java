package kz.epam.raiymbek.entity;

import lombok.*;

import java.util.Date;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Match {
    private int matchId;
    private Date date;
    private String stadium;
    private int teamOneId;
    private int teamTwoId;
    private int teamOneScore;
    private int teamTwoScore;
}
