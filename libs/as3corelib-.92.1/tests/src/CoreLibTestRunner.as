/*
  Copyright (c) 2008, Adobe Systems Incorporated
  All rights reserved.

  Redistribution and use in source and binary forms, with or without 
  modification, are permitted provided that the following conditions are
  met:

  * Redistributions of source code must retain the above copyright notice, 
    this list of conditions and the following disclaimer.
  
  * Redistributions in binary form must reproduce the above copyright
    notice, this list of conditions and the following disclaimer in the 
    documentation and/or other materials provided with the distribution.
  
  * Neither the name of Adobe Systems Incorporated nor the names of its 
    contributors may be used to endorse or promote products derived from 
    this software without specific prior written permission.

  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
  IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
  THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
  PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR 
  CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
  EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
  PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
  PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
  LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
  NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

import com.adobe.crypto.HMACMD5Test;
import com.adobe.crypto.HMACSHA1Test;
import com.adobe.crypto.MD5Test;
import com.adobe.crypto.SHA1Test;
import com.adobe.crypto.SHA224Test;
import com.adobe.crypto.SHA256Test;
import com.adobe.crypto.WSSEUsernameTokenTest;
import com.adobe.net.URITest;
import com.adobe.serialization.json.JSONTest;
import com.adobe.utils.ArrayUtilTest;
import com.adobe.utils.DateUtilTest;
import com.adobe.utils.IntUtilTest;
import com.adobe.utils.NumberFormatterTest;
import com.adobe.utils.StringUtilTest;
import com.adobe.utils.XMLUtilTest;
import com.adobe.utils.DictionaryUtilTest;

import flexunit.framework.TestSuite;
import com.adobe.images.JPGEncoderTest;
import com.adobe.images.PNGEncoderTest;

			
private function onCreationComplete():void
{
	testRunner.test = createSuite();
	testRunner.startTest();	
}

private function createSuite():TestSuite
{
	var ts:TestSuite = new TestSuite();

	// utils
	ts.addTestSuite( StringUtilTest );
	ts.addTestSuite( NumberFormatterTest );
	ts.addTestSuite( ArrayUtilTest );
	ts.addTestSuite( DateUtilTest );
	ts.addTestSuite( IntUtilTest );
	ts.addTestSuite( XMLUtilTest );
	ts.addTestSuite( DictionaryUtilTest );
	
	// crypto
	ts.addTestSuite( HMACSHA1Test );
	ts.addTestSuite( HMACMD5Test );
	ts.addTestSuite( MD5Test );
	ts.addTestSuite( SHA1Test );
	ts.addTestSuite( SHA224Test );
	ts.addTestSuite( SHA256Test );
	ts.addTestSuite( WSSEUsernameTokenTest );
	
	// net
	ts.addTestSuite( URITest );
	
	// serialization
	ts.addTestSuite( JSONTest );		
	
	//images
	ts.addTestSuite( JPGEncoderTest );
	ts.addTestSuite( PNGEncoderTest );
	
	return ts;
}
