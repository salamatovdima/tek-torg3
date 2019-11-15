<?php

function analyze($string, $start = 0, $brecket = null)
{
    if (strlen($string) == 0)
        return true;

    $place_holder = '_';

    static $new, $error = false;

    $new = $string;


    $opens = ['(', '[', '{'];
    $closes = ['(' => ')', '[' => ']', '{' => '}'];

    //Если предполагается, что строка может содержать другие символы, кроме скобок, то включить очистку
    //$not_breckets=array_merge($opens, array_values($closes));
    //$new=preg_replace('/[^\\'.implode(',\\', $not_breckets).']+/', '', $new);

    for ($i = $start; $i < strlen($new); $i++) {

        if ($new[$i] == $place_holder) {
            continue;
        }

        //На каждой открывающейся скобке уходим в рекурсию
        if (in_array($new[$i], $opens)) {
            $closed_brecket_position = analyze($new, ($i + 1), $new[$i]);

            //Внутри рекурсии ищем позицию парной закрывающейся скобки
            //Если найдем, то блок внутренних скобох заполняем спец символом
            //Если пара не найдена, то ошибка. В данном случае нет закрывающей парной скобки

            if ($closed_brecket_position) {

                for ($j = $i; $j <= $closed_brecket_position; $j++) {
                    $new[$j] = $place_holder;
                }
                continue;

            } else {
                $error = true;
                return false;
            }

        } elseif ($brecket === null) {
            $error = true;
            return false;
        }

        if ($brecket) {

            if ($new[$i] == $closes[$brecket])
                return $i;

            $error = true;
            return false;
        }
    }

    if ($brecket === null) {
        return !$error;
    }

}

$strings = [
    '()[]{}',
    '([{}])',
    '(}',
    '[(])',
    '[({})](]'
];

foreach ($strings as $string) {
    echo $string . ' => ' . (analyze($string) ? "true" : "false") . PHP_EOL;
}