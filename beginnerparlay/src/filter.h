#pragma once

#include <iostream>
#include <string>

#include <parlay/primitives.h>
#include <parlay/sequence.h>
#include <parlay/parallel.h>
#include "prefix.h"


parlay::sequence<int> filter(parlay::sequence<int>& arr, std::function<bool(int)> f);