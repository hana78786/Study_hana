package com.kh.pilot.recipe.service.logic;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pilot.recipe.domain.Recipe;
import com.kh.pilot.recipe.domain.RecipeComment;
import com.kh.pilot.recipe.domain.RecipeMaterial;
import com.kh.pilot.recipe.domain.RecipeStep;
import com.kh.pilot.recipe.domain.RecipeTag;
import com.kh.pilot.recipe.domain.Recommandation;
import com.kh.pilot.recipe.service.RecipeService;
import com.kh.pilot.recipe.store.RecipeStore;
@Service
public class RecipeServiceImpl implements RecipeService{
	@Autowired
	private RecipeStore rStore;
	@Autowired
	private SqlSessionTemplate session; 
	
	/**
	 * 레시피 등록
	 */
	@Override
	public int registRecipe(Recipe recipe) {
		int result = rStore.insertRecipe(recipe, session);
		return result;
	}
	
	
	/**
	 * 레시피 순서 등록
	 */
	@Override
	public int registStep(List<RecipeStep> rsList) {
		int result = rStore.insertStep(rsList, session);
		
		
		return result;
	}
/**
 * 레시피 태그 등록
 */
	@Override
	public int registTag(RecipeTag rTag) {
		int result = rStore.insertTag(rTag, session);
		return result;
	}

	/**
	 * 레시피 재료 등록
	 */
	@Override
	public int registMaterial(List<RecipeMaterial> rmList) {
		int result = rStore.insertMaterial(rmList, session);
		return result;
	}
/** 댓글 출력*/
	
	@Override
	public List<RecipeComment> printRecipeCommentList(int recipeNo, int currentPage, int limit) {
		List<RecipeComment> rcList = rStore.selectRecipeCommentList(recipeNo, session, currentPage,limit);
		return rcList;
	}

	@Override
	public int checkRecommand(int recipeNo, String memberEmail) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int allRecipeCommentList(int page, int limit, int recipeNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	/**레시피 추천*/
	@Override
	public int setRecommand(Recommandation recommand) {
		int result= rStore.insertRecommand(recommand, session);
		
		return result;
	}

	@Override
	public int removeRecommand(Recommandation recommand) {
		int result = rStore.deleteRecommand(recommand, session);
		return result;
	}

	/**레시피수정*/
	@Override
	public int modifyOneRecipe(Recipe recipe) {
		int result = rStore.updateOneRecipe(session, recipe);
		return result;
	}

	/**레시피 순서 수정*/
	@Override
	public int modifyOneRecipeStep(List<RecipeStep> rsList) {
		int result= rStore.updateOneRecipeStep(session, rsList);
		return result;
	}

	/***레시피 재료 수정*/
	@Override
	public int modifyOneRecipeMaterial(List<RecipeMaterial> rmList) {
		int result = rStore.updateOneRecipeMaterial(session, rmList);
		return result;
	}

	/**레시피 태그 수정*/
	@Override
	public int modifyOneRecipeTag(RecipeTag rTag) {
		int result = rStore.updateOneRecipeTag(session, rTag);
		return result;
	}

	/**
	 * 레시피 삭제
	 */
	@Override
	public int removeOneRecipe(int redipeNo) {
		int result = rStore.deleteOneRecipe(session, redipeNo);
				
		return result;
	}
/**
 * 레시피 리스트 출력
 */
	@Override
	public List<Recipe> printRecipeList(int currentPage, int limit) {
	 List<Recipe> rList = rStore.selectAllRecipe(currentPage, limit, session);
		return rList;
	}

	/**
	 * 상세 레시피, 레시피
	 */
	@Override
	public Recipe printOneRecipe(int recipeNo) {
		Recipe recipe = rStore.selectOneRecipe(recipeNo, session);
		return recipe;
	}

	/**상세레시피 순서*/
	@Override
	public List<RecipeStep> printOneRecipeStep(int recipeNo) {
		List<RecipeStep>  rsList = rStore.selectOneRecipeDetail(recipeNo, session);
		return rsList;
	}
	
	/**
	 * 상세 레시피 레시피 재료
	 */
	@Override
	public List<RecipeMaterial> printOneRecipeMaterial(int recipeNo) {
		 List<RecipeMaterial> rmList = rStore.selectOneRecipeMaterial(recipeNo, session);
		return rmList;
	}

	/**상세 레시피 태그*/
	@Override
	public RecipeTag printOneRecipeTag(int recipeNo) {
		RecipeTag rTag = rStore.selectOneRecipeTag(recipeNo, session);
		return rTag;
	}

/**
 * 이미지 삭제
 */
	@Override
	public int removeOneImg(String picName) {
		int result = rStore.deleteOneImg(session, picName);
		return result;
	}

/***
 * 추천레시피 불러오기
 */
@Override
public List<Recipe> recomadRecipe(String recipeCategory) {
	List<Recipe> RecommandList = rStore.selectRecomandRecipe(session,recipeCategory);
	return RecommandList;
}

/**댓글 갯수 가져오기*/
@Override
public int getTotalCount(int recipeNo) {
	int count = rStore.selectTotalCount(session,recipeNo);
	return count;

}
	
	

}
