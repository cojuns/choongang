package article.service;

import org.springframework.beans.factory.annotation.Autowired;

import article.dao.ArticleContentDao;
import article.dao.ArticleDao;
import article.model.Article;

public class DeleteArticleService {

	@Autowired
	private ArticleDao articleDao;
	
	@Autowired
	private ArticleContentDao contentDao;

	public void delete(DeleteRequest delReq) {

			
			Article article = articleDao.selectById(delReq.getArticleNumber());
			if (article == null) {
				throw new ArticleNotFoundException();
			}
			if (!canDelete(delReq.getUserId(), article)) {
				throw new PermissionDeniedException();
			}
			articleDao.delete(delReq.getArticleNumber());
			contentDao.delete(delReq.getArticleNumber());
	}

	private boolean canDelete(String deletingUserId, Article article) {
		return article.getWriter().getId().equals(deletingUserId);
	}
}
