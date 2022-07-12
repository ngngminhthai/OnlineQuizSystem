/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utils;

import DAL.QuizDAO;
import Models.Quiz;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import org.apache.catalina.core.ApplicationContext;

/**
 * Web application lifecycle listener.
 *
 * @author Admin
 */

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Web application lifecycle listener.
 *
 * @author Admin
 */
public class WebListenerApp implements HttpSessionListener, HttpSessionAttributeListener {

    public static Timer timer;
    int count = 0;
    Date startDate = new Date();
    Date endDate = new Date();

    /**
     * Class này có mục đích override method run của TimerTask để thực hiện
     * remove session.
     *
     * @author ADMN
     */
    class RemindTask extends TimerTask {

        private HttpSessionBindingEvent se;

        public RemindTask(HttpSessionBindingEvent se) {
            this.se = se;
        }

        @Override
        public void run() {
            se.getSession().removeAttribute("doingQuiz");
            timer.cancel(); //Terminate the timer thread
        }
    }

    public void Time(int seconds, HttpSessionBindingEvent se) {
        timer = new Timer();
        timer.schedule(new RemindTask(se), seconds * 1000); // schedule the task
    }

    /**
     * set a timer for auto submit quiz
     *
     * @param se the session that be changed
     * <code>HttpSessionBindingEvent</code> object
     */
    @Override
    public void attributeAdded(HttpSessionBindingEvent se) {
        if (se.getName().equalsIgnoreCase("doingQuiz")) {
            startDate = new Date();
            Quiz q = (Quiz) se.getValue();
            if (count == 0) {
                Time(q.getDuration(), se);
                count++;
            }
        }
    }

    /**
     * set a timer for auto submit quiz
     *
     * @param se the session that be changed
     * <code>HttpSessionBindingEvent</code> object
     */
    @Override
    public void attributeRemoved(HttpSessionBindingEvent se) {
        if (se.getName().equalsIgnoreCase("doingQuiz")) {
            try {
                endDate = new Date();
                double timeTaken = endDate.getTime() - startDate.getTime();
                timeTaken = timeTaken / 1000;
                QuizDAO qd = new QuizDAO();
                Quiz quiz = (Quiz) se.getValue();
                quiz.setTimeTaken(timeTaken);
                count = 0;
                qd.calculateScore(quiz);
                timer.cancel();
            } catch (Exception e) {

            }
        }
    }

    @Override
    public void sessionCreated(HttpSessionEvent se) {

    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
    }

    @Override
    public void attributeReplaced(HttpSessionBindingEvent event) {
    }

}
