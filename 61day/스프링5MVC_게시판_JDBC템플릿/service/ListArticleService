package article.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import article.dao.ArticleDao;
import article.model.Article;

public class ListArticleService {
	@Autowired
	private ArticleDao articleDao;
	private int size = 10;

	public ArticlePage getArticlePage(int pageNum) {
		
		int total = articleDao.selectCount();
		
		List<Article> content = articleDao.select((pageNum - 1) * size, size);
		return new ArticlePage(total, pageNum, size, content);

	}
}
