<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Database\Eloquent\Model;
use App\Markers;
use Auth;
//use GeneaLabs\Phpgmaps\Facades\PhpgmapsFacade;

class GmapsController extends Controller
{
    //
    public function index()
    {

    	$marcadores = Markers::all();


        return view('gmaps', compact('map'));
    }

    public function mapas_angular()
    {
        $valor = Auth::user()->role_id;
        //dd($valor);
        //return view("mapas.pruebam", ["valor" => $valor]);
        return view("mapas.probando_voyager", ["valor" => $valor]);
    }







    protected function data()
    {
        $users = [
            ["id" => 1, "username" => "iparra", "created_at" => date("Y-m-d")],
            ["id" => 2, "username" => "juan", "created_at" => date("Y-m-d")],
            ["id" => 3, "username" => "andrés", "created_at" => date("Y-m-d")],
            ["id" => 4, "username" => "luís", "created_at" => date("Y-m-d")]
        ];
        return $users;
    }
 
    /**
     * @return string
     * @throws Exception
     */
    protected function toCsv()
    {
        $array = Export::data();
 
        if (count($array) == 0) {
            throw new Exception("Array cannot be empty");
        }
 
        // disable caching
        $filename = "data_" . date('d-m-Y') . ".csv";
        $now = gmdate("D, d M Y H:i:s");
 
        Export::headers($filename, $now);
 
        ob_start();
        $df = fopen("php://output", 'w');
 
        fputcsv($df, array_keys(reset($array)));
        foreach ($array as $row) {
            fputcsv($df, $row);
        }
        fclose($df);
        return ob_get_clean();
    }
 
    /**
     * @return string
     * @throws Exception
     */
    protected function toJson()
    {
        $array = Export::data();
 
        if (count($array) == 0) {
            throw new Exception("Array cannot be empty");
        }
 
        // disable caching
        $filename = "data_" . date('d-m-Y') . ".json";
        $now = gmdate("D, d M Y H:i:s");
 
        Export::headers($filename, $now);
 
        ob_start();
        $response = array();
 
        $response["users"] = $array;
 
        $fp = fopen("php://output", 'w');
        fwrite($fp, json_encode($response));
        fclose($fp);
        return ob_get_clean();
    }
 
    /**
     * @return string
     * @throws Exception
     */
    protected function toExcel()
    {
        $array = Export::data();
 
        if (count($array) == 0) {
            throw new Exception("Array cannot be empty");
        }
 
        $headers = ''; // just creating the var for field headers to append to below
        $data = ''; // just creating the var for field data to append to below
 
        foreach (array_keys($array[0]) as $columns)
        {
            $headers.=$columns. "\t";
        }
 
        foreach ($array as $row) {
            $line = '';
 
            foreach ($row as $key => $value)
            {
                if ((!isset($value)) OR ($value == "")) {
                    $value = "\t";
                } else {
                    $value = str_replace('"', '""', $value);
                    $value = '"' . $value . '"' . "\t";
                }
                $line .= $value;
            }
            $data .= trim($line) . "\n";
        }
 
        $data = str_replace("\r", "", $data);
 
        header("Content-type: application/x-msdownload");
        header("Content-Disposition: attachment; filename=data_" . date('d-m-Y') . ".xls");
        return mb_convert_encoding("$headers\n$data", 'utf-16', 'utf-8');
    }
 
    /**
     * @return mixed
     * @throws Exception
     *
    protected function toXml()
    {
        // if ($request->isMethod('post')){    
        //     return response()->json(['response' => 'This is post method']); 
        // }
        // //return response()->json(['response' => 'This is get method']);
        // else {

                $array =  Markers::all();
                if (count($array) == 0) {
                    throw new Exception("Array cannot be empty");
                }
                $xml = new \SimpleXMLElement('<xml/>');
                $track = $xml->addChild('markers');
                foreach ($array as $key)
                {
                    // $track = $xml->addChild('marker');
                    
                    andando 
                     $marker = $track->addChild('marker');
                     $value = array(
                        "id" =>  $key->id,
                        "name" =>  $key->name,
                        "address" =>  $key->address,
                        "lat" =>  $key->lat,
                        "lng" =>  $key->lng,
                        "type" =>  $key->type
                        );
                    foreach($value as $k => $v)
                    {
                        $marker->addChild($k, $v);
                    }

                    Fin de andando
                    *

                     $marker = $track->addChild('marker');
                     $value = array(
                        "id" =>  $key->id,
                        "name" =>  $key->name,
                        "address" =>  $key->address,
                        "lat" =>  $key->lat,
                        "lng" =>  $key->lng,
                        "type" =>  $key->type
                        );
                    foreach($value as $k => $v)
                    {
                        $marker->addAttribute($k, $v);
                    }

                }
                $listo =$xml->asXML();
               // dd($listo);
               // $listo = str_replace('<xml>', '', $listo);
                //$listo = str_replace('</xml>', '', $listo);
                //$listo = str_replace('<?xml version="1.0">', '', $listo);
            //    return $xml->asXML();
        		//header("Content-disposition: attachment; filename=data_" . date('d-m-Y') . ".xml");

        		header("Content-Type: text/xml");
        		dd ($xml->asXML());
       //  echo ($xml->markers[0]);
             //  echo $listo;


    }
*/


function parseToXML($htmlStr)
{
$xmlStr=str_replace('<','&lt;',$htmlStr);
$xmlStr=str_replace('>','&gt;',$xmlStr);
$xmlStr=str_replace('"','&quot;',$xmlStr);
$xmlStr=str_replace("'",'&#39;',$xmlStr);
$xmlStr=str_replace("&",'&amp;',$xmlStr);
return $xmlStr;
}


    protected function toXml()
    {
    	header("Content-type: text/xml");
		// Start XML file, echo parent node
		echo '<markers>';
		$array =  Markers::all();
		foreach ($array as $key)
        {
		  echo '<marker ';
		  echo 'id="' . $key->id . '" ';
		  echo 'name="' . $this->parseToXML($key->name) . '" ';
		  echo 'address="' . $this->parseToXML($key->address) . '" ';
		  echo 'lat="' . $key->lat . '" ';
		  echo 'lng="' . $key->lng . '" ';
		  echo 'type="' . $key->type . '" ';
		  echo '/>';
        	
        }
		// Iterate through the rows, printing XML nodes for each
		// End XML file
		echo '</markers>';
    }
    /**
     * @param $filename
     * @param $now
     */
    protected function headers($filename, $now)
    {
        header("Expires: Tue, 03 Jul 2001 06:00:00 GMT");
        header("Cache-Control: max-age=0, no-cache, must-revalidate, proxy-revalidate");
        header("Last-Modified: {$now} GMT");
        // force download
        header("Content-Type: application/force-download");
        header("Content-Type: application/octet-stream");
        header("Content-Type: application/download");
        // disposition / encoding on response body
        header("Content-Disposition: attachment;filename={$filename}");
        header("Content-Transfer-Encoding: binary");
    }



    public function probando_xml()
    {
       $this->toXml();

    }
    public function cosas()
    {
    	return view("mapas.cosas");
    }

    
     public function angularfire()
    {
        return view("mapas.angularfire");
    }

      public function todossssss()
    {
        return view("mapas.todo");
    }


  public function geofire()
    {
        return view("mapas.geofire");
    }


}
