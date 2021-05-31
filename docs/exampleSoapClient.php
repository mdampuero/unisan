<?php
// $client_id='9bf6dd42-35b9-46dd-948a-1c3c91906caa';
        // $wsdl_url="https://wlogisticvot.azurewebsites.net/wLogisticVOT.asmx?WSDL";
        // $user='UNISAN';
        // $pass='UNiSaN.2021';    

        // $options_arr=array('trace' => TRUE);

        // $client = new \SoapClient($wsdl_url, $options_arr);

        // $headerParams = array('ret:UserName'    => $user,'ret:Password'      => $pass);

        // $soapStruct = new \SoapVar($headerParams, SOAP_ENC_OBJECT);

        // $header = new \SoapHeader('namespace', 'ret:AuthHeader', $soapStruct, false);
        // $headerbody = array('UsernameKey'=>array('Username'=>$user,
        //                                  'Password'=>$password)); 
        // $header = new SOAPHeader($ns, 'RequestorCredentials', $headerbody);       

        // //set the Headers of Soap Client.

        // $client->__setSoapHeaders($header);
        // $metodos=$client->
        // $result=$client->__soapCall('GetListaConvenios', ['ret:UserName'    => $user,'ret:Password'      => $pass,'r'=>'','sP'=>'']);
        // echo '<pre>';
        // print_r($client);
        // echo '</pre>';
        // exit();
        //$client = new \SoapClient('https://wlogisticvot.azurewebsites.net/wLogisticVOT.asmx?WSDL',array());

        // $auth = array(
        //         'UserName'=>'UNISAN',
        //         'Password'=>'UNiSaN.2021',
        //         'SystemId'=> array('_'=>'DATA','Param'=>'PARAM'),
        //         );
        // $header = new \SoapHeader('NAMESPACE','AuthHeader',$auth,false);
        // $client->__setSoapHeaders($header);
        // //$result=$client->__call('GetListaConvenios',[]);
        // $result=$client->__soapCall('GetListaConvenios', array('parameters' => []));
        // echo '<pre>';
        // print_r($result);
        // echo '</pre>';
        // exit();

        // $client = new \SoapClient('https://wlogisticvot.azurewebsites.net/wLogisticVOT.asmx?WSDL', array(
        //     "exceptions" => 0, 
        //     "trace" => 1, 
        //     "encoding" => null,
        //     'stream_context' => stream_context_create(array(
        //         'http' => array(
        //             'header' => ['UserName: UNISAN', 'password:UNiSaN.2021']
        //         ),
        //     )),
        // ));
        // echo '<pre>';
        // print_r($client);
        // echo '</pre>';
        // exit();

        // $soapClient = new \SoapClient('https://wlogisticvot.azurewebsites.net/wLogisticVOT.asmx?WSDL', [
        //     'trace' => 1,
        //     'exceptions' => 0,
        // ]);
        
        // // Must be a stdClass (and not an array)
        // $auth = new \stdClass();
        // $auth->UserName = 'UNISAN';
        // $auth->Password = 'UNiSaN.2021';
        
        // $header = new \SoapHeader('https://wlogisticvot.azurewebsites.net/wLogisticVOT.asmx?WSDL', 'AuthHeader', $auth);
        
        // $soapClient->__setSoapHeaders($header);
        
        // // $result = $soapClient->GetListaConvenios([]);
        // $result = $soapClient->__soapCall('GetListaConvenios',[]);
        // echo '<pre>';
        // print_r($result);
        // echo '</pre>';
        // exit();
        // echo "====== REQUEST HEADERS =====" . PHP_EOL;
        // var_dump($soapClient->__getLastRequestHeaders());
        
        // echo "========= REQUEST ==========" . PHP_EOL;
        // var_dump($soapClient->__getLastRequest());
        
        // echo "========= RESPONSE ==========" . PHP_EOL;
        // var_dump($result);
        //     exit();
        // $client     = new \SoapClient('https://wlogisticvot.azurewebsites.net/wLogisticVOT.asmx?WSDL', array("trace" => 1, "exception" => 0));
        // $url         = "https://wlogisticvot.azurewebsites.net/wLogisticVOT.asmx?WSDL";
        // $client     = new SoapClient($url, array("trace" => 1, "exception" => 0));

        // // Create the header
        // $auth         = new ChannelAdvisorAuth($devKey, $password);
        // $header     = new SoapHeader("https://wlogisticvot.azurewebsites.net/wLogisticVOT.asmx?WSDL", "APICredentials", $auth, false);

        // // Call wsdl function
        // $result = $client->__soapCall("DeleteMarketplaceAd", array(
        //     "DeleteMarketplaceAd" => array(
        //         "accountID"        => $accountId,
        //         "marketplaceAdID"    => "9938745"        // The ads ID
        //     )
        // ), NULL, $header);

        // // Echo the result
        // echo "<pre>".print_r($result, true)."</pre>";
        // echo '<pre>';
        // print_r($client);
        // echo '</pre>';
        // exit();