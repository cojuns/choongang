package command;

import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import config.AppCtx;

public class ControllerUsingURI extends HttpServlet {
	
	// 어디서든 사용할 수 있게 설정
	//public static ApplicationContext ctx;
	
	// @Autowired
	// BoardService boardService;
	ApplicationContext ctx;
	
    // <커맨드, 핸들러인스턴스> 매핑 정보 저장
    private Map<String, String> commandHandlerMap = 
    		new HashMap<>();
    // 서블릿 초기화 메서드
    public void init() throws ServletException {
    	
    	ctx = new AnnotationConfigApplicationContext(AppCtx.class);
    	
     	// configFile 초기화 파라미터를 읽어온다.
        // 이 값을 이용해서 설정 파일 경로를 구한다.
        String configFile = getInitParameter("configFile");
        System.out.println(configFile);
        Properties prop = new Properties();
        String configFilePath = getServletContext().getRealPath(configFile);
        System.out.println(configFilePath);
        // 설정 파일로부터 매핑 정보를 읽어와 Properties 객체에 저장한다.
        // Properties는 (이름, 값) 목록을 갖는 클래스로서,
        // 이 경우에는 프로퍼티 이름을 커맨드 이름으로 사용하고
        // 값을 클래스 이름으로 사용한다.
        try (FileReader fis = new FileReader(configFilePath)) { // 파일 읽기
        	// 설정 파일을 읽어서 Properties 객체에 로드 ( 맵에 보관 ) 
            prop.load(fis);
        } catch (IOException e) {
            throw new ServletException(e);
        }
        // Properties에 저장된 각 프로퍼티의 키에 대해 다음 작업을 반복한다.
        Iterator keyIter = prop.keySet().iterator();
        while (keyIter.hasNext()) {
        	// 1. 프로퍼티 이름을 커맨드 이름으로 사용한다.
            String command = (String) keyIter.next();
            // 2. 커맨드 이름에 해당하는 핸들러 클래스 이름을 Properties에서 구한다.
            String handlerClassName = prop.getProperty(command);
            commandHandlerMap.put(command, handlerClassName);
//            try {
//            	// 3. 핸들러 클래스 이름을 이용해서 Class 객체를 구한다.
//                Class<?> handlerClass = Class.forName(handlerClassName);
//                // 4. Class로부터 핸들러 객체를 생성한다. 
//                CommandHandler handlerInstance = 
//                        (CommandHandler) handlerClass.newInstance();
//             // 5. commandHandlerMap에 (커맨드, 핸들러 객체)에 대한 매핑 정보를 저장한다.
//                commandHandlerMap.put(command, handlerInstance);
//            } catch (ClassNotFoundException | InstantiationException 
//            		| IllegalAccessException e) {
//                throw new ServletException(e);
//            }
        }
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        process(request, response);
    }

    protected void doPost(HttpServletRequest request,
    HttpServletResponse response) throws ServletException, IOException {
        process(request, response);
    }
    
    // 클라이언트로부터 들어오는 HTTP 요청에 대해 처리를 수행
    // 그에 맞는 핸들러를 호출하여 요청을 처리하고 결과를 뷰 페이지에 전달
    private void process(HttpServletRequest request,
    HttpServletResponse response) throws ServletException, IOException {
    	// 클라이언트가 요청한 URI를 가져온다.
		String command = request.getRequestURI();
		// 요청된 URI가 웹 어플리케이션의 Context Path(컨텍스트 경로)로 시작한다면,
		// Context Path 부분을 제거하여 실제로 처리할 명령어를 추출
		// 예)/hello.do 추출
		if (command.indexOf(request.getContextPath()) == 0) {
			command = command.substring(request.getContextPath().length());
		}
		System.out.println(command);
		// 추출된 명령어를 사용하여 commandHandlerMap에서 해당 커맨드에 대응하는 핸들러를 가져온다.
		// commandHandlerMap은 init() 메서드에서 설정 파일로부터 읽어온 커맨드와 핸들러 클래스를 매핑한 맵
//        CommandHandler handler = commandHandlerMap.get(command);
//        // 만약 해당 명령어에 대응하는 핸들러가 없다면, 기본적으로 NullHandler를 사용
//        if (handler == null) {
//            handler = new NullHandler();
//        }
        // 찾아낸 핸들러를 사용하여 실제 요청 처리를 수행
        // 핸들러의 process() 메서드를 호출하여 요청 처리 결과로 뷰 페이지의 경로를 가져온다.
        // 최종적으로 클라이언트에게 보여질 JSP 페이지의 위치를 나타낸다.
        String handler = commandHandlerMap.get(command);
        System.out.println(handler);
        // 인터페이스 다형성
        CommandHandler helloHandler = ctx.getBean(handler, CommandHandler.class);
		String viewPage = null;
        try {
            viewPage = helloHandler.process(request, response);
            
        } catch (Throwable e) {
            throw new ServletException(e);
        }
        // 만약 뷰 페이지 경로가 존재한다면, RequestDispatcher를 사용하여 해당 뷰 페이지로 포워딩
        // 즉, 요청된 작업의 처리 결과를 클라이언트에게 보여줄 JSP 페이지로 이동하게 된다.
        if (viewPage != null) {
	        RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
	        dispatcher.forward(request, response);
        }
    }
}
