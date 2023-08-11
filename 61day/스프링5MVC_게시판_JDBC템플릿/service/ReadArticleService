package article.service;

import org.springframework.beans.factory.annotation.Autowired;

import article.dao.ArticleContentDao;
import article.dao.ArticleDao;
import article.model.Article;
import article.model.ArticleContent;

public class ReadArticleService {
	
	@Autowired
	private ArticleDao articleDao;
	
	@Autowired
	private ArticleContentDao contentDao;
	
	public ArticleData getArticle(int articleNum, boolean increaseReadCount) {

			Article article = articleDao.selectById(articleNum);
			if (article == null) {
				throw new ArticleNotFoundException();
			}
			ArticleContent content = contentDao.selectById(articleNum);
			if (content == null) {
				throw new ArticleContentNotFoundException();
			}
			if (increaseReadCount) {
				articleDao.increaseReadCount(articleNum);
			}
			return new ArticleData(article, content);
		
	}
}
