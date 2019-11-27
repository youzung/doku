package model.vo;

import java.util.List;

public class BoardVO {
	private int id;
	private String header;
	private String title;
	private String content;
	private String writedate;
	private String nickname;
	private int cnt;
	private String key;
	private String searchType;
	private int page;
	private String src;
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getHeader() {
		return header;
	}
	public void setHeader(String header) {
		this.header = header;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getSrc() {
		return src;
	}
	public void setSrc(String src) {
		this.src = src;
	}
	@Override
	public String toString() {
		return "BoardVO [id=" + id + ", header=" + header + ", title=" + title + ", content=" + content + ", writedate="
				+ writedate + ", nickname=" + nickname + ", cnt=" + cnt + ", key=" + key + ", searchType=" + searchType
				+ ", page=" + page + ", src=" + src + "]";
	}

}
