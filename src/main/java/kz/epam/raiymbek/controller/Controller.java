package kz.epam.raiymbek.controller;

import kz.epam.raiymbek.config.AppConfig;
import kz.epam.raiymbek.entity.Player;
import kz.epam.raiymbek.service.PlayerService;
import kz.epam.raiymbek.service.TeamService;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@org.springframework.stereotype.Controller
public class Controller {

    @RequestMapping(value = "/playerList")
    public ModelAndView playerList() {
        ModelAndView modelAndView = new ModelAndView();
        AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(AppConfig.class);
        PlayerService playerService = context.getBean(PlayerService.class);
        modelAndView.setViewName("WEB-INF/playerlist.jsp");
        modelAndView.addObject("playerList", playerService.getAllPlayers());
        context.close();
        return modelAndView;
    }
    @RequestMapping("/teamList")
    public ModelAndView teamList() {
        ModelAndView modelAndView = new ModelAndView();
        AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(AppConfig.class);
        TeamService teamService = context.getBean(TeamService.class);
        modelAndView.setViewName("WEB-INF/teamlist.jsp");
        modelAndView.addObject("teamList", teamService.getAllTeams());
        context.close();
        return modelAndView;
    }
    @RequestMapping("/editPlayer")
    public ModelAndView editPlayer(HttpServletRequest request, HttpServletResponse response){
        ModelAndView modelAndView = new ModelAndView();
        AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(AppConfig.class);
        PlayerService playerService = context.getBean(PlayerService.class);
        playerService.editPlayer(Player.builder().playerId(Integer.parseInt(request.getParameter("playerId"))).name(request.getParameter("name")).surname(request.getParameter("surname")).playerNumber(Integer.parseInt(request.getParameter("playerNumber"))).teamId(Integer.parseInt(request.getParameter("teamId"))).build());
        modelAndView.setViewName("WEB-INF/playerlist.jsp");
        modelAndView.addObject("playerList", playerService.getAllPlayers());
        context.close();
        return modelAndView;
    }
    @RequestMapping("/deletePlayer")
    public ModelAndView deletePlayer(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView modelAndView = new ModelAndView();
        AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(AppConfig.class);
        PlayerService playerService = context.getBean(PlayerService.class);
        playerService.deletePlayer(Player.builder().playerId(Integer.parseInt(request.getParameter("playerId"))).build());
        modelAndView.setViewName("WEB-INF/playerlist.jsp");
        modelAndView.addObject("playerList", playerService.getAllPlayers());
        context.close();
        return modelAndView;
    }
    @RequestMapping("/editPlayerForm")
    public ModelAndView editPlayerForm(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView modelAndView = new ModelAndView();
        AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(AppConfig.class);
        PlayerService playerService = context.getBean(PlayerService.class);
        TeamService teamService = context.getBean(TeamService.class);
        modelAndView.setViewName("WEB-INF/editplayerform.jsp");
        modelAndView.addObject("teamList", teamService.getAllTeams());
        modelAndView.addObject("player", playerService.getPlayerById(Integer.parseInt(request.getParameter("playerId"))));
        context.close();
        return modelAndView;
    }
    @RequestMapping("/addPlayerForm")
    public ModelAndView addPlayerForm() {
        ModelAndView modelAndView = new ModelAndView();
        AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(AppConfig.class);
        TeamService teamService = context.getBean(TeamService.class);
        modelAndView.addObject("teamList", teamService.getAllTeams());
        modelAndView.setViewName("WEB-INF/addplayerform.jsp");
        context.close();
        return modelAndView;
    }
    @RequestMapping("/savePlayer")
    public ModelAndView savePlayer(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(AppConfig.class);
        PlayerService playerService = context.getBean(PlayerService.class);
        playerService.addPlayer(Player.builder().name(request.getParameter("name")).
                surname(request.getParameter("surname")).
                playerNumber(Integer.parseInt(request.getParameter("playerNumber"))).
                teamId(Integer.parseInt(request.getParameter("teamId"))).build());
        modelAndView.setViewName("WEB-INF/playerlist.jsp");
        modelAndView.addObject("playerList", playerService.getAllPlayers());
        context.close();
        return modelAndView;
    }
}
