<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Database\Eloquent\Model;
use App\Markers;
//use GeneaLabs\Phpgmaps\Facades\PhpgmapsFacade;

class GmapsController extends Controller
{
    //
    public function index()
    {

    	$marcadores = Markers::all();


    	// Start XML file, create parent node
$doc = domxml_new_doc("1.0");
$node = $doc->create_element("markers");
$parnode = $doc->append_child($node);


		header("Content-type: text/xml");
    	foreach ($marcadores as $mer) {
		    echo $mer->name;

		  $node = $doc->create_element("marker");
		  $newnode = $parnode->append_child($node);

		  $newnode->set_attribute("name", $mer->name);
		  $newnode->set_attribute("address", $mer->address);
		  $newnode->set_attribute("lat", $mer->lat);
		  $newnode->set_attribute("lng", $mer->lng);
		  $newnode->set_attribute("type", $mer->type);

		}
		//die();


		// Iterate through the rows, adding XML nodes for each
		// while ($row = @mysql_fetch_assoc($result)){
		//   // Add to XML document node
		//   $node = $doc->create_element("marker");
		//   $newnode = $parnode->append_child($node);

		//   $newnode->set_attribute("name", $row['name']);
		//   $newnode->set_attribute("address", $row['address']);
		//   $newnode->set_attribute("lat", $row['lat']);
		//   $newnode->set_attribute("lng", $row['lng']);
		//   $newnode->set_attribute("type", $row['type']);
		// }

		$xmlfile = $doc->dump_mem();
		echo $xmlfile;

die();
     
        return view('gmaps', compact('map'));
    }
}
