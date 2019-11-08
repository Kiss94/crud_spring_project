package kz.epam.raiymbek.entity;

import lombok.*;

import java.util.Date;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class InsertLog {
    private int logId;
    private Date insertDate;
    private String referencesTableName;
    private String description;
}
