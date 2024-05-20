package kr.bit.controller;

import kr.bit.entity.Board;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class BoardController {
    //jackson-databind(객체를 -> json으로 데이터포맷으로 반환
    @RequestMapping("/boardList")
    public @ResponseBody List<Board> boardList() {
        List<Board> list = boardMapper.getLists();
        return list; //json 데이터 형식으로 반환해서 리턴하겠다
    }
}
