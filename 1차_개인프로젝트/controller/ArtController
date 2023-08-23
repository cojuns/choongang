package controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import article.model.Writer;
import article.service.ArticleContentNotFoundException;
import article.service.ArticleData;
import article.service.ArticleNotFoundException;
import article.service.ArticlePage;
import article.service.DeleteArticleService;
import article.service.DeleteRequest;
import article.service.ListArticleService;
import article.service.ModifyArticleService;
import article.service.ModifyRequest;
import article.service.PermissionDeniedException;
import article.service.ReadArticleService;
import article.service.WriteArticleService;
import article.service.WriteRequest;
import auth.service.User;

@Controller
public class ArtController {

	@Autowired
	private ListArticleService listArticleService;

	@Autowired
	private ModifyArticleService modifyArticleService;

	@Autowired
	private ReadArticleService readArticleService;

	@Autowired
	private WriteArticleService writeArticleService;
	
	@Autowired
	private DeleteArticleService deleteArticleService;

//	        /article/write.do 글쓰기
//			/article/list.do 목록보기
//			/article/read.do 글내용 보기
//			/article/modify.do 글수정
//			/article/delete.do 글삭제

	@GetMapping("/list.do")
	public String listArticle(Model model, @RequestParam(value = "pageNo", required = false) String pageNoVal) {
		int pageNo = 1;
		if (pageNoVal != null) {
			pageNo = Integer.parseInt(pageNoVal);
		}
		ArticlePage articlePage = listArticleService.getArticlePage(pageNo);
		model.addAttribute("articlePage", articlePage);
		return "listArticle";
	}

	@GetMapping("/read.do")
	public String readArticle(Model model, 
			@RequestParam(value = "no", defaultValue = "0") 
	                                             Integer articleNum) {
		try {
			ArticleData articleData = readArticleService.getArticle(articleNum, true);
			model.addAttribute("articleData", articleData);
			return "readArticle";
		} catch (ArticleNotFoundException | ArticleContentNotFoundException e) {
			// res.sendError(HttpServletResponse.SC_NOT_FOUND);
			return "errorPage";
		}
	}

	@GetMapping("/write.do")
	public String writeArticle1() {
		return "newArticleForm";
	}

	private WriteRequest createWriteRequest(User user, HttpServletRequest req) {
		return new WriteRequest(new Writer(user.getId(), user.getName()), req.getParameter("title"),
				req.getParameter("content"));
	}

	@PostMapping("/write.do")
	public String writeArticle2(Model model, HttpServletRequest req) {
		Map<String, Boolean> errors = new HashMap<>();
		model.addAttribute("errors", errors);

		User user = (User) req.getSession(false).getAttribute("authUser");
		System.out.println(user.getId());
		WriteRequest writeReq = createWriteRequest(user, req);
		writeReq.validate(errors);
		
		if (!errors.isEmpty()) {
			return "newArticleForm";
		}

		int newArticleNo = writeArticleService.write(writeReq);
		model.addAttribute("newArticleNo", newArticleNo);
		
		return "listArticle";

	}

	private boolean canModify(User authUser, ArticleData articleData) {
		String writerId = articleData.getArticle().getWriter().getId();
		return authUser.getId().equals(writerId);
	}

	@GetMapping("/modify.do")
	public String modifyArticle1(Model model, HttpServletRequest req) {
		try {
			String noVal = req.getParameter("no");
			int no = Integer.parseInt(noVal);
			ArticleData articleData = readArticleService.getArticle(no, false);
			User authUser = (User) req.getSession().getAttribute("authUser");
			if (!canModify(authUser, articleData)) {
				//res.sendError(HttpServletResponse.SC_FORBIDDEN);
				return "errorPage";
			}
			ModifyRequest modReq = new ModifyRequest(authUser.getId(), no, articleData.getArticle().getTitle(),
					articleData.getContent());

			model.addAttribute("modReq", modReq);
			return "modifyForm";
		} catch (ArticleNotFoundException e) {
			//res.sendError(HttpServletResponse.SC_NOT_FOUND);
			return "errorPage";
		}
	}

	@PostMapping("/modify.do")
	public String modifyArticle2(HttpServletRequest req, Model model) {
		User authUser = (User) req.getSession().getAttribute("authUser");
		String noVal = req.getParameter("no");
		int no = Integer.parseInt(noVal);

		ModifyRequest modReq = new ModifyRequest(authUser.getId(), no, req.getParameter("title"),
				req.getParameter("content"));
		model.addAttribute("modReq", modReq);

		Map<String, Boolean> errors = new HashMap<>();
		model.addAttribute("errors", errors);
		modReq.validate(errors);
		if (!errors.isEmpty()) {
			return "modifyForm";
		}
		try {
			modifyArticleService.modify(modReq);
			return "listArticle";
		} catch (ArticleNotFoundException e) {
			//res.sendError(HttpServletResponse.SC_NOT_FOUND);
			return "errorPage";
		} catch (PermissionDeniedException e) {
			//res.sendError(HttpServletResponse.SC_FORBIDDEN);
			return "errorPage";
		}
	}
	
	@GetMapping("/delete.do")
	public String deleteArticle(HttpServletRequest req, Model model) {
		User authUser = (User) req.getSession().getAttribute("authUser");
		String noVal = req.getParameter("no");
		int no = Integer.parseInt(noVal);

		DeleteRequest delReq = new DeleteRequest(authUser.getId(), no);
		model.addAttribute("delReq", delReq);

		try {
			deleteArticleService.delete(delReq);
			return "listArticle";
		} catch (ArticleNotFoundException e) {
			//res.sendError(HttpServletResponse.SC_NOT_FOUND);
			return "errorPage";
		} catch (PermissionDeniedException e) {
			//res.sendError(HttpServletResponse.SC_FORBIDDEN);
			return "errorPage";
		}
	}
	

	
	@GetMapping("/test2")
	@ResponseBody
	public String test2() {
		return "Test2";
	}
	
	
}
