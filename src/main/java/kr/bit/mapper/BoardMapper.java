package kr.bit.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;

import kr.bit.entity.Board;

@Mapper
public interface BoardMapper {
	
	public List<Board> getLists(); 
	
	public void boardInsert(Board vo);
	
	public Board boardContent(int idx);
	
	public void boardDelete(int idx);
	
	public void boardUpdate(Board vo);
	
	@Update("update bitboard set count=count+1 where idx=#{idx}")
	public void boardCount(int idx);

}
