package kz.epam.raiymbek.dao.impl;

import kz.epam.raiymbek.config.AppConfig;
import kz.epam.raiymbek.dao.TeamDAO;
import kz.epam.raiymbek.entity.Team;
import org.junit.jupiter.api.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.transaction.annotation.Transactional;

import static org.junit.jupiter.api.Assertions.*;

class TeamDAOImplTest {
    @Test
    @Transactional
    void add() {
        AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(AppConfig.class);
        TeamDAO dao = context.getBean(TeamDAO.class);
        assertEquals(dao.add(Team.builder().teamId(0).name("TEST").country("TEST").build()),true);
    }
}