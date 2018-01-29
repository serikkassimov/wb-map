package services;

import datas.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Properties;

@Component
public class UserService {
    @Autowired
    private DataServices dataServices;
    public User getUser(String login) {
        User user = new User();
        user.setLogin(login);
        Properties properties = dataServices.loadProperties();
        String pass = properties.getProperty("password");
        if ((pass==null)&&(pass.isEmpty())) {
            user.setPassword("7110eda4d09e062aa5e4a390b0a572ac0d2c0220");
        } else {
            user.setPassword(pass);
        }
      //  user.setPassword("b5086eedf7d27ee691ac2552dd399162b1d2da4e");
        return user;
    }
}
