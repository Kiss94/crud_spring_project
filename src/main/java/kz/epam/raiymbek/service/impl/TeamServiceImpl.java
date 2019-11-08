package kz.epam.raiymbek.service.impl;

import kz.epam.raiymbek.dao.impl.TeamDAOImpl;
import kz.epam.raiymbek.entity.Team;
import kz.epam.raiymbek.service.TeamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class TeamServiceImpl implements TeamService {
    @Autowired
    private TeamDAOImpl teamDAO;
    @Override
    public boolean addTeam(Team team) {
        return teamDAO.add(team);
    }

    @Override
    public boolean deleteTeam(Team team) {
        return teamDAO.delete(team);
    }

    @Override
    public boolean editTeam(Team team) {
        return teamDAO.edit(team);
    }

    @Override
    public List<Team> getAllTeams() {
        return teamDAO.listAllTeams();
    }

    @Override
    public Team getTeamById(int id) {
        return teamDAO.getTeam(id);
    }
}
