package article.service;

import org.springframework.beans.factory.annotation.Autowired;

import article.dao.ArticleContentDao;
import article.dao.ArticleDao;
import article.model.Article;

public class ModifyArticleService {

	@Autowired
	private ArticleDao articleDao ;
	@Autowired
	private ArticleContentDao contentDao; 
	
	public void modify(ModifyRequest modReq) {

			
			Article article = articleDao.selectById(modReq.getArticleNumber());
			if (article == null) {
				throw new ArticleNotFoundException();
			}
			if (!canModify(modReq.getUserId(), article)) {
				throw new PermissionDeniedException();
			}
			articleDao.update(modReq.getArticleNumber(), modReq.getTitle());
			contentDao.update(modReq.getArticleNumber(), modReq.getContent());
			

	}

	private boolean canModify(String modfyingUserId, Article article) {
		return article.getWriter().getId().equals(modfyingUserId);
	}
}
