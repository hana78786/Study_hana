package com.kh.pilot.recipe.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.pilot.panda.domain.QAComment;
import com.kh.pilot.recipe.domain.RecipeComment;
import com.kh.pilot.recipe.service.RecipeCommentService;
@Controller
public class RecipeCommentCotroller {
	
	@Autowired
	RecipeCommentService rcService ;
/**
 * 코멘트 등록
 * @param mv
 * @param rComment
 * @param session
 * @return
 */
	@RequestMapping(value="/recipe/commentWrite.do", method=RequestMethod.POST)
	public ModelAndView registRecipeComment(ModelAndView mv,@ModelAttribute RecipeComment rComment,HttpSession session ) {
		//나중에 세션으로 반드시 로그인 체크할것! 로그안 안되어있으면 오류메세지 로그인해주세요로 연결
		try {
			
			
		
		int result = rcService.registRecipeComment(rComment);
		mv.setViewName("redirect:/recipe/detail.do?recipeNo="+rComment.getRecipeNo()+"#reply-area");
		
		}catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/error");
		}
		return mv;
	}
	
	/**
	 * 코멘트 수정
	 * @param mv
	 * @param rComment
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/recipe/commentModify.do")
	public ModelAndView modifyRecipeComment(ModelAndView mv,@ModelAttribute RecipeComment rComment,HttpSession  session) {
		try {
			
			int result = rcService.modifyOneRecipeComment(rComment);
			mv.setViewName("redirect:/recipe/detail.do?recipeNo="+rComment.getRecipeNo()+"#reply-area");
			
			}catch (Exception e) {
				mv.addObject("msg", e.getMessage());
				mv.setViewName("common/error");
			}
			return mv;	
	}
	
	/**
	 * 코멘트 삭제
	 * @param session
	 * @param mv
	 * @param commentNo
	 * @param recipeNo
	 * @param memberEmail
	 * @return
	 */
	@RequestMapping(value="/recipe/removeComment.do", method=RequestMethod.GET)
	public ModelAndView removeRecipeComment( HttpSession session ,ModelAndView mv,@RequestParam("commentNo")Integer commentNo,@RequestParam("recipeNo")Integer recipeNo,
			@RequestParam(value="memberEmail", required = false)String memberEmail) {
		
		try {
		int result = rcService.removeOneRecipeComment(commentNo);
		mv.setViewName("redirect:/recipe/detail.do?recipeNo="+recipeNo+"#reply-area");
			
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/error");
		}
		
		return mv;
	}



}
