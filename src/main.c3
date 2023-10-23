module urneal;

import std::io;
import libc;

const int X    = 10;
const int Y    = 10;
const int SEED = 100;

double[][] terrain;

def rand = libc::rand;

fn int main(String[] args) 
{
    libc::srand(SEED);

    terrain = calloc(double[], X);
    
    foreach (&i : terrain) *i = calloc(double, Y);
    
    defer free(terrain);
    defer foreach (i : terrain) free(i);

    // terrain generation code here

    return 0;
}