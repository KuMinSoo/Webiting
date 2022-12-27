/*
 * 평점 Mapper -> 미완성
 */
package com.product.mapper;

import com.product.model.UpdateReplyDTO;

public interface ReplyMapper {

	public Double getRatingAverage(int pnum);
	
	public int updateRating(UpdateReplyDTO dto);
	
}
