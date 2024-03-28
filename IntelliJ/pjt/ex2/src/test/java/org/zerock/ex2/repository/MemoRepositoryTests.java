package org.zerock.ex2.repository;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import org.springframework.data.domain.Sort;
import org.springframework.test.annotation.Commit;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.ex2.entity.Memo;

import java.util.List;
import java.util.Optional;
import java.util.stream.IntStream;

//MemoRepositoryTests 클래스를 스프링 부트 테스트 클래스로 지정
@SpringBootTest
public class MemoRepositoryTests {

    //MemoRepository 타입의 memoRepository 객체를 주입받음
    @Autowired
    MemoRepository memoRepository;

    //memoRepository 객체가 제대로 주입되었는지 확인
    @Test
    public void testClass() {
        System.out.println(memoRepository.getClass().getName());
    }

    //insert 테스트
    @Test
    public void testInsertDummies() {

        IntStream.rangeClosed(1, 100).forEach(i -> {
            Memo memo = Memo.builder().memoText("Sample..." + i).build();
            memoRepository.save(memo);
        });
    }

    //select 테스트
    @Test
    public void testSelect() {

        //데이터베이스에 존재하는 mno
        Long mno = 100L;
        Optional<Memo> result = memoRepository.findById(mno);
        System.out.println("====================================");
        if (result.isPresent()) {
            Memo memo = result.get();
            System.out.println(memo);
        }
    }

    //getOne() 테스트
    @Transactional
    @Test
    public void testSelect2() {

        //데이터베이스에 존재하는 mno
        Long mno = 100L;
        Memo memo = memoRepository.getOne(mno);
        System.out.println("====================================");
        System.out.println(memo);
    }

    //update 테스트
    @Test
    public void testUpdate() {

        Memo memo = Memo.builder().mno(100L).memoText("Update Text").build();
        System.out.println(memoRepository.save(memo));
    }

    //delete 테스트
    @Test
    public void testDelete() {

        Long mno = 100L;
        memoRepository.deleteById(mno);
    }

    //페이징 처리 테스트
    @Test
    public void testPageDefault() {
        // 1페이지, 10개씩
        Pageable pageable = PageRequest.of(0, 10);
        Page<Memo> result = memoRepository.findAll(pageable);
        System.out.println(result);

        System.out.println("---------------------------------------");
        System.out.println("Total Pages: " + result.getTotalPages()); //총 몇 페이지
        System.out.println("Total Count: " + result.getTotalElements()); //전체 개수
        System.out.println("Page Number: " + result.getNumber()); //현재 페이지 번호 0부터 시작
        System.out.println("Page Size: " + result.getSize()); //페이지당 데이터 개수
        System.out.println("has next page?: " + result.hasNext()); //다음 페이지 존재 여부
        System.out.println("first page?: " + result.isFirst()); //시작 페이지(0) 여부

        System.out.println("---------------------------------------");
        for (Memo memo : result.getContent()) {
            System.out.println(memo);
        }
    }

    //페이징 처리 테스트
    @Test
    public void testSort() {

        Sort sort1 = Sort.by("mno").descending();
        Pageable pageable = PageRequest.of(0, 10, sort1);
        Page<Memo> result = memoRepository.findAll(pageable);
        result.get().forEach(memo -> {
            System.out.println(memo);
        });
    }

    @Test
    public void testQueryMethods() {
//        List<Memo> list = memoRepository.findByMnoBetweenOrderByMnoDesc(70L, 80L);
        //@Query 사용
        List<Memo> list = memoRepository.getListDesc();
        for (Memo memo : list) {
            System.out.println(memo);
        }
    }

    //페이징 처리 테스트
    @Test
    public void testQueryMethodWithPageable() {
        Pageable pageable = PageRequest.of(0, 10, Sort.by("mno").descending());
        Page<Memo> result = memoRepository.findByMnoBetween(10L, 50L, pageable);
        result.get().forEach(memo -> System.out.println(memo));
        }

    //delete 쿼리 메서드 테스트
    @Commit
    @Transactional
    @Test
    public void testDeleteQueryMethods() {
        memoRepository.deleteMemoByMnoLessThan(10L);
    }



}