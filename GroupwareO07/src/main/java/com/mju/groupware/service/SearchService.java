package com.mju.groupware.service;

import java.util.List;

import com.mju.groupware.dto.Professor;
import com.mju.groupware.dto.SearchKeyWord;
import com.mju.groupware.dto.Student;
import com.mju.groupware.dto.User;

public interface SearchService {

	public List<User> SelectKeyWord(SearchKeyWord searchKeyWord);

	public Student SelectStudentInfo(int i);

	public Professor SelectProfessorInfo(int userID);

}
