package kr.bit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.bit.entity.Board;
import kr.bit.mapper.BoardMapper;

@RequestMapping("/board")
@RestController
public class BoardRestTestController {
	
	@Autowired
	BoardMapper boardMapper;
	
	@GetMapping("/list")
	public List<Board> boardList(){
		List<Board> list=boardMapper.getLists();
		return list; 
	}
	
	@PostMapping("/create")
	public void boardInsert(Board vo){
		boardMapper.boardInsert(vo);
	}

	@DeleteMapping("/{idx}")
	public void boardDelete(@PathVariable("idx") int idx) {
		boardMapper.boardDelete(idx);
	}
	//
	//post, get, delete(삭제), put(업데이트)
	@PutMapping("/update")
	public void boardUpdate(@RequestBody Board vo) {
		boardMapper.boardUpdate(vo);
	}
	
	@GetMapping("/{idx}")
	public Board boardContent(@PathVariable("idx") int idx) {
		Board vo=boardMapper.boardContent(idx);
		return vo;  //{idx:2,title:w,content:33....}
	}
	
	@PutMapping("/count/{idx}")
	public Board boardCount(@PathVariable("idx") int idx) {
		boardMapper.boardCount(idx);
		Board vo=boardMapper.boardContent(idx);
		return vo;
	}

}
