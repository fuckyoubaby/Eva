package com.changhong.test.dao;

import java.util.Date;
import java.util.Random;

import org.junit.Ignore;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.Assert;

import com.changhong.dao.CommentDao;
import com.changhong.dao.PhaseDao;
import com.changhong.dao.ProjectDao;
import com.changhong.entities.Comment;
import com.changhong.entities.Phase;
import com.changhong.entities.Project;
/**
 * CommentDao的测试类
 * @author guoxiaoyang
 *
 */
public class CommentDaoTest extends BaseDaoTest {
	private final static Logger log  = LoggerFactory.getLogger(CommentDaoTest.class);
	
	@Autowired
	private CommentDao commentDao;
	
	@Autowired
	private ProjectDao projectDao;
	
	@Autowired
	private PhaseDao phaseDao;
	
	private Project project;
	private Phase phase;
	
	public void init(){
		String projectId="p20150706";
		int phaseId = 1;
		project = projectDao.get(Project.class, projectId);
		phase = phaseDao.get(Phase.class, phaseId);
		Assert.notNull(project,"初始化：project对象不能为空");
		Assert.notNull(phase,"初始化：phase对象不能为空");
	}

	@Ignore
	public void testGet(){
		String tId = "40288a7257b7c7e90157b7c7fac00000";
		Comment c = commentDao.get(Comment.class, tId);
		
		Assert.notNull(c, "get测试：id="+tId+"获取的comment实例不能为空");
		
		
	}
	@Test
	public void testUpdate(){
		String tId = "40288a7257b7c7e90157b7c7fac00000";
		Comment c = commentDao.get(Comment.class, tId);
		Assert.notNull(c, "get测试：id="+tId+"获取的comment实例不能为空");
		String oldName = c.getName();
		String newName = oldName+ new Random().nextInt(100);
		log.info("oldName="+oldName+",newName=="+newName);
		c.setName(newName);
		commentDao.update(c);
		String currentName = commentDao.get(Comment.class, tId).getName();
		log.info("现在 name="+currentName);
		Assert.isTrue(currentName.equals(newName));
	}
	
	/*@Ignore
	public void testSaveAndDelete() throws InterruptedException{
		init();
		Comment comment = new Comment(project, phase, "测试一哈123", new Date());
		String id  = commentDao.saveEntity(comment);
		comment.setId(id);
		log.info("保存成功"+comment.getId());
		Assert.isTrue(id==comment.getId(), id+"=="+comment.getId());
		
		Comment c = commentDao.get(Comment.class, comment.getId());
		Assert.notNull(c, "save测试：id="+id+"获取的comment实例不能为空");
		log.info("获取成功"+id);
		
		String oldName = comment.getName();
		String newName = oldName+ new Random().nextInt(100);
		log.info("oldName="+oldName+",newName=="+newName);
		comment.setName(newName);
		commentDao.update(comment);
		log.info("现在 name="+commentDao.get(Comment.class, id).getName());
		
		Thread.sleep(2000);
		
		commentDao.delete(Comment.class, comment.getId());
		Comment d = commentDao.get(Comment.class, comment.getId());
		Assert.isNull(d, "delete测试：id="+id+"获取的comment实例应为空");
		log.info("删除成功"+id);
	}*/
	
/*	@Ignore
	public void testSaveAndDelete2() throws InterruptedException{
		init();
		Comment comment = new Comment(project, phase, "测试一哈123", new Date());
		commentDao.save(comment);
		log.info("保存成功"+comment.getId());
		String id = comment.getId();
		Comment c = commentDao.get(Comment.class, comment.getId());
		Assert.notNull(c, "save测试：id="+id+"获取的comment实例不能为空");
		log.info("获取成功"+id);
		Thread.sleep(2000);
		commentDao.delete(Comment.class, comment.getId());
		Comment d = commentDao.get(Comment.class, comment.getId());
		Assert.isNull(d, "delete测试：id="+id+"获取的comment实例应为空");
		log.info("删除成功"+id);
	}*/
	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	public Phase getPhase() {
		return phase;
	}

	public void setPhase(Phase phase) {
		this.phase = phase;
	}


}
