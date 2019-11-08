package kz.epam.raiymbek.entity;

import lombok.*;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Team {
    private int teamId;
    private String name;
    private String country;
}
