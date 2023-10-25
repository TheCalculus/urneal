module urneal;

import std::io;
import libc;

import perlin;

const int X_SZ = 10;
const int Y_SZ = 10;
const int SEED = 100;

double[][] terrain;

def rand = libc::rand;

fn int main(String[] args)
{
    perlin::seed = SEED;

    libc::srand(SEED);

    terrain = calloc(double[], X_SZ);

    // TODO: run terrain generation code within this loop
    // as well, rather than just calloc'ing to prevent the need
    // to iterate through each element later anyway.

    foreach (&i
             : terrain)
        *i = calloc(double, Y_SZ);

    defer free(terrain);
    defer foreach (i
                   : terrain) free(i);

    for (int x = 0; x < X_SZ; x++)
    {
        for (int y = 0; y < Y_SZ; y++)
        {
            double sample = perlin::noise2d(x, y);
            io::printn(sample);

            terrain[x][y] = sample;
        }
    }

    // io::printn(terrain);

    return 0;
}