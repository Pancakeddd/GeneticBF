#include <iostream>
#include <iomanip>
#include <fstream>
#include <streambuf>
#include "bf.h"
#include "gene.h"

const int generation_size = 2000;

int main(int argc, char *argv[])
{
  if (argc > 1)
  {

    auto b = BFEnvironment();

    std::ifstream file;
    file.open(argv[1]);
    std::string inp((std::istreambuf_iterator<char>(file)), (std::istreambuf_iterator<char>()));
    file.close();

    auto r = b.Read(inp);

    auto ip = b.Transform(r);
    auto ip_op = b.Optimize(ip);

    //for (auto i : ip_op)
    // {
    //  std::cout << i->Show() << std::endl;
    //}

    Incubator incb;

    for (size_t i = 0; i < generation_size; i++)
    {
      auto c = std::make_shared<Creature>();
      c->GenerateCode();

      incb.creatures.push_back(c);
    }

    for (size_t i = 0; i < 100; ++i)
    {
      std::cout << "TIME: " << i << std::endl;
      for (size_t j = 0; j < generation_size; ++j)
      {
        std::cout << incb.creatures[j]->Recompile() << std::endl;
      }
      incb.Evolve();
    }

    for (size_t j = 0; j < generation_size; ++j)
    {
      std::cout << incb.creatures[j]->Recompile() << std::endl;
    }
    //for (auto &i : ip_op)
    //{
    //  i->Execute(b);
    //}
  }
  return 0;
}