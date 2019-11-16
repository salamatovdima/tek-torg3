<?php

function build($num, $placeholder){
    $res=[];

    $num=(int)$num;

    for($i=0; $i<$num; $i++){
        $clear=str_repeat(' ', ($num-$i-1));
        $res[]=$clear.str_repeat($placeholder, ($i*2+1)).$clear;
    }

    return $res;
}


$res=build(9,'*');

print_r($res);
