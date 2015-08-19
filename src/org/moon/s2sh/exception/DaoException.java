/*
 * Copyright 2005 ����
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.moon.s2sh.exception;

/**
 * DAO�쳣
 * @author ����
 */
public class DaoException extends Exception {

    /**
	 * 
	 */
	private static final long serialVersionUID = 435518761870404711L;

	/**
     *  ��Ĭ�ϵĹ��캯����һ��DaoException����
     */
    public DaoException() {
        super();
    }

    /**
     * �ô���Ĳ���message����һ��DaoException����
     * 
     * @param message 
     *                 �����쳣�����ԭ��
     */
    public DaoException(String message) {
        super(message);
    }
}