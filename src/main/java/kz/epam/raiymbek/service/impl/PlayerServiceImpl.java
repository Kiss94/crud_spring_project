package kz.epam.raiymbek.service.impl;

import kz.epam.raiymbek.dao.impl.PlayerDAOImpl;
import kz.epam.raiymbek.entity.Player;
import kz.epam.raiymbek.service.PlayerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class PlayerServiceImpl implements PlayerService {
    @Autowired
    private PlayerDAOImpl playerDAO;
    @Override
    public boolean addPlayer(Player player) {
        return playerDAO.add(player);
    }

    @Override
    public boolean deletePlayer(Player player) {
        return playerDAO.delete(player);
    }

    @Override
    public boolean editPlayer(Player player) {
        return playerDAO.edit(player);
    }

    @Override
    public List<Player> getAllPlayers() {
        return playerDAO.listAllPlayers();
    }

    @Override
    public Player getPlayerById(int id) {
        return playerDAO.getPlayer(id);
    }
}
