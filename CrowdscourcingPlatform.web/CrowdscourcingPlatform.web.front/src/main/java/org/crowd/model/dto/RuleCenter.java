package org.crowd.model.dto;

import org.crowd.model.Rule;

/**
 * <p>Title : RuleCenter</p>
 * <p>Description : </p>
 * <p>DevelopTools : Eclipse_x64_v4.9.0</p>
 * <p>DevelopSystem : Win10 x64 </p>
 * <p>Company : org.Lw</p>
 * @author : Lw
 * @date : 2018年12月17日 上午11:06:24
 * @version : 12.0.0
 */
public class RuleCenter extends Rule {
	private String rteName;

	public RuleCenter() {
		super();
	}

	public RuleCenter(String rteName) {
		super();
		this.rteName = rteName;
	}

//----------------get&set------------------
	public String getRteName() {
		return rteName;
	}

	public void setRteName(String rteName) {
		this.rteName = rteName;
	}

}
