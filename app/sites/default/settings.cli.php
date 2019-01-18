<?php

$memory = skpr_config('cli.memory') ?: '256M';
ini_set('memory_limit', $memory);