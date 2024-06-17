package com.board.mvc;

import java.sql.Time;
import java.sql.Timestamp;
public class PostDTO {
	private String storeName;
	private int storeIndex;
	private Time timer;
	private String delivery;
	private String bankName;
	private String account;
	private String delitype;
	private String maxPeople;
	private Timestamp date;
	private int indexNum;
	private String id;
	private String name;
	private boolean isExpired;
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getIndexNum() {
		return indexNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setIndexNum(int indexNum) {
		this.indexNum = indexNum;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	
	public String getStoreName() {
		return storeName;
	}
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	public int getStoreIndex() {
		return storeIndex;
	}
	public void setStoreIndex(int storeIndex) {
		this.storeIndex = storeIndex;
	}
	public Time getTimer() {
		return timer;
	}
	public void setTimer(Time timer) {
		this.timer = timer;
	}
	public String getDelivery() {
		return delivery;
	}
	public void setDelivery(String delivery) {
		this.delivery = delivery;
	}
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getDelitype() {
		return delitype;
	}
	public void setDelitype(String delitype) {
		this.delitype = delitype;
	}
	public String getMaxPeople() {
		return maxPeople;
	}
	public void setMaxPeople(String maxPeople) {
		this.maxPeople = maxPeople;
	}
	
	
}
