package article.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;

import article.dao.ArticleContentDao;
import article.dao.ArticleDao;
import article.model.Article;
import article.model.ArticleContent;

public class WriteArticleService {
	@Autowired
	private ArticleDao articleDao;
	@Autowired
	private ArticleContentDao contentDao;

	public Integer write(WriteRequest req) {


			Article article = toArticle(req);
			Article savedArticle = articleDao.insert(article);
			if (savedArticle == null) {
				throw new RuntimeException("fail to insert article");
			}
			ArticleContent content = new ArticleContent(
					savedArticle.getNumber(),
					req.getContent());
			ArticleContent savedContent = contentDao.insert(content);
			if (savedContent == null) {
				throw new RuntimeException("fail to insert article_content");
			}

			return savedArticle.getNumber();

	}
	


	private Article toArticle(WriteRequest req) {
		Date now = new Date();
		return new Article(null, req.getWriter(), req.getTitle(), "now", "now", 0);
	}
}
